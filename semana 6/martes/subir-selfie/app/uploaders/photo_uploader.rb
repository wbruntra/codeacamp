class PhotoUploader < CarrierWave::Uploader::Base
  # ...
  include CarrierWave::MiniMagick

  # Que tipo de strorage usará este uploader

  def store_dir
    # Como y donde guardar el archivo ...
    'img'
  end

  storage :file
  # Versiones del archivo ...

  #Que extensiones vas a aceptar
end
