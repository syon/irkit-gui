# coding: utf-8

get '/' do
  load_settings
  @irkit_keys = get_irkit_keys
  File.read(File.join('app', 'dist', 'index.html'))
end

get '/data' do
  load_settings
  @irkit_keys = get_irkit_keys
  json :irkit_keys => @irkit_keys
end

post '/' do
  ir_key  = params[:ir_key]
  @result = irkit('post', ir_key)
end

post '/save' do
  ir_key  = params[:ir_key]
  @result = irkit('get', ir_key)
  redirect '/'
end

post '/delete' do
  ir_key  = params[:ir_key]
  @result = irkit('delete', ir_key, 'Y')
  redirect '/'
end

def irkit(opt, ir_key, answer="")
  load_settings
  answer = "echo #{answer} | " if answer
  if @addr
    result = `#{answer} irkit --#{opt} "#{ir_key}" --address #{@addr}`
  else
    result = `#{answer} irkit --#{opt} "#{ir_key}"`
  end
  result
end

def load_settings
  @addr = settings.IRKIT_ADDRESS
rescue
end

def get_irkit_keys
  data_file = File.expand_path('.irkit.json', ENV['HOME'])
  ir_data = JSON.parse(File.open(data_file).read)["IR"]
  ir_data.keys
end
