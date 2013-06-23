# omniauth-sfdc-background

[OmniAuth](https://github.com/intridea/omniauth) strategy for logging in to
[salesforce.com](salesforce.com) without leaving your app.

To use OAuth, check [omniauth-salesforce](https://github.com/richardvanhook/omniauth-salesforce).

## Basic Usage

```ruby
require 'sinatra'
require 'omniauth'
require 'omniauth-sfdc-background'

class MyApplication < Sinatra::Base
  use Rack::Session
  use OmniAuth::Builder do
    provider :sfdc_background,
             ENV['SFDC_CLIENT_ID'], ENV['SFDC_CLIENT_SECRET'],
             host: ENV['SFDC_HOST'], name: 'salesforce'
  end
end
```
