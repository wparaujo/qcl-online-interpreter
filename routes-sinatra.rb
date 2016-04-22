require 'sinatra'
require 'open3'
require 'tilt/erubis'
require 'stringio'

# command = "ruby -v"
# a = 0
# Open3.popen3(command) do |stdout, stderr, status, thread|
#   a = stderr.read
# end
#
# puts a.to_s
# a = a.to_s.gsub "\n", "<br>"
# b = 0
# if a.include? " "
#   a = a.gsub " ", "&nbsp"
# end
#stdin, stdout, stderr, status, thread = Open3.popen3('qcl')

get '/' do
  erb :console
end

post '/post-command' do
  command = params['command']
  stdin, stdout, stderr, status, thread = Open3.popen3('qcl')
  stdin.puts(command)
  stdin.close
  io = StringIO.new
  io.write stdout.readlines.join(" ").gsub "qcl>", ""
  # io.string.slice! "qcl>"
  # io.string.slice! 'qcl> \n'
  # io.string.gsub "qcl>", ""
  io.string.slice! command
  io.string
end

get '/get-response-command' do
  # response = session[:response_command]
  # response
end
