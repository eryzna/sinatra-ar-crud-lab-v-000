
require './config/environment'

begin

  use Rack::MethodOverride

  run ApplicationController

end
