Paperclip.interpolates(:s3_ncal_url) do |att, style|
  "#{att.s3_protocol}://s3-us-west-1.amazonaws.com/#{att.bucket_name}/#{att.path(style)}"
end