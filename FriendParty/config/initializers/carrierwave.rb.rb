::CarrierWave.configure do |config|
  config.storage             = :qiniu
  config.qiniu_access_key    = "C-I87I2L5BeYoAWXBLFGS77wfRvDrlvPbYUOBYOC"
  config.qiniu_secret_key    = '_zMsX8gF9G_kiCFGYckm64gbUHbJ_GStnU7JxIOv'
  config.qiniu_bucket        = "carrierwave-qiniu-example"
  config.qiniu_bucket_domain = "7xo3me.com1.z0.glb.clouddn.com "
  config.qiniu_bucket_private= true #default is false
  config.qiniu_block_size    = 4*1024*1024
  config.qiniu_protocol      = "http"

end
