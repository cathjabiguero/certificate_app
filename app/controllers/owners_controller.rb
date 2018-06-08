class OwnersController < ApplicationController
  before_action :set_owner, only: [:show, :edit, :update, :destroy]

  # GET /owners
  # GET /owners.json
  def index
    @owners = Owner.all  
    if params[:search]#for search bar
      @owners = Owner.search(params[:search]).order("created_at DESC")
    else
      @owners = Owner.all.order("created_at DESC")
    end
    respond_to do |format|
      format.html
      format.csv {send_data @owners.to_csv}
      format.xlsx {send_data @owners.to_csv(col_sep: "\t")}
      format.pdf do
        if @data.nil?
          @owners = render :pdf => 'certificate', 
                          :layout => 'student_pdf.html', 
                          :template => 'owners/show.pdf.erb'
        else
          @owners = render :pdf => 'certificate', 
                          :layout => 'teacher_pdf.html', 
                          :template => 'owners/show.pdf.erb'
        end
      end
    end
  end

  # GET /owners/1
  # GET /owners/1.json
  def show
    respond_to do |format|
      format.html
      format.pdf do
        if @data.nil?
          @owners = render :pdf => 'certificate', 
                          :layout => 'student_pdf.html', 
                          :template => 'owners/show.html.erb'
        else
          @owners = render :pdf => 'certificate', 
                          :layout => 'teacher_pdf.html', 
                          :template => 'owners/show.html.erb'
        end
      end
    end
  end


def template
  @data = params[:cert_temp]
end
  # GET /owners/new
  def new
    @owner = Owner.new
  end

  # GET /owners/1/edit
  def edit
  end

  # POST /owners
  # POST /owners.json
  def create
    @owner = Owner.new(owner_params)
    qrcode = RQRCode::QRCode.new(@owner.recipient_name)
    png = qrcode.as_png(
          resize_gte_to: false,
          resize_exactly_to: 120,
          fill: 'white',
          color: 'black',
          border_modules: 4,
          module_px_size: 6,
          file: nil # path to write
          )
    @owner.qr_code = png.to_string

    Owner.delete_all if Owner.count > 0
    respond_to do |format|
      if @owner.save
        format.html { redirect_to template_owners_path, notice: 'Owner was successfully created.' }
        format.json { render :show, status: :created, location: @owner }
      else
        format.html { render :new }
        format.json { render json: owners_path.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /owners/1
  # PATCH/PUT /owners/1.json
  def update
    respond_to do |format|
      if @owner.update(owner_params)
        format.html { redirect_to owners_path, notice: 'Owner was successfully updated.' }
        format.json { render :show, status: :ok, location: @owner }
      else
        format.html { render :edit }
        format.json { render json: owners_path.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /owners/1
  # DELETE /owners/1.json
  def destroy
    @owner.destroy
    respond_to do |format|
      format.html { redirect_to owners_url, notice: 'Owner was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  def import
    Owner.delete_all if Owner.count > 0
    if params[:file].blank?
      redirect_to import_instructions_owners_path, notice: 'No CSV file uploaded'
    else
      Owner.import(params[:file], params[:logo])
      redirect_to template_owners_path, notice: 'Import Added Successfully.'
    end
  end

  def import_instructions

  end  

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_owner
      @owner = Owner.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def owner_params
      params.require(:owner).permit(:header, :title, :subtitle, :recipient_name, :first_paragraph,
       :second_paragraph, :first_assignatory_name , :first_assignatory_position, 
       :second_assignatory_name, :second_assignatory_position, :logo)
    end
end