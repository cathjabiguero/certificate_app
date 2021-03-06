<h1>Certificate App</h1>
<hr>
<p>A simple automated generation of <i>Certificates</i> designed for Students and Teachers.</p>
<h2>Getting Started</h2>
<h3>How this project can be used?</h3>
<p><ul>
  <li>Generate certificates into PDF using a template and data from a csv file.</li>
</ul></p>
<hr>
<h3>Requirements</h3>
<p><ul>
  <li>Ruby (sample apps were written with Ruby 22.5.0p0)</li><br>
  <li>Rails 5.1.6</li><br>
  <li>Bundler for Ruby, a dependency manager</li> 
</ul></p>

<h3>Installation</h3>
<p><ul>
    <li>Code Editor: Just install whatever code editor you prefer. <br> Personally, I used VSCode.</li> 
</ul></p>

<h3>Gems</h3>
<p>Here are the gems used by the application:
<br> Source: https://rubygems.org
  <ul>
      <li>[dragonfly 1.1.5](https://github.com/markevans/dragonfly) - generate image thumbnails in Rails</li>
      <li>[pry](https://github.com/pry/pry) - an IRB alternative and runtime developer console.</li>
      <li>[wicked_pdf](https://github.com/mileszs/wicked_pdf) - serve a PDF file to a user from HTML.</li>
      <li>[RSpec-rails](https://github.com/rspec/rspec-rails) 3.5 - a testing framework.</li>
  </ul>
</p>
<h3>Running the app</h3>
<p>`$ rails server`<br><br>
To see your application in action, open a browser window and navigate to `http://localhost:3000/`.

You should see a home page with a lists of owners of the certificates.<br>
To stop the server, type `Control-C`.</p>