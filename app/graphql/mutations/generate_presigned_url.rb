
module Mutations
  class GeneratePresignedUrl < BaseMutation
    argument :filename, String, required: true
    argument :filetype, String, required: true

    field :url, String, null: false
    field :upload_url, String, null: false

    def resolve(filename:, filetype:)
      s3_bucket = Aws::S3::Resource.new.bucket(Rails.application.credentials.dig(:aws, :bucket))
      obj = s3_bucket.object("uploads/#{filename}")
      presigned_url = obj.presigned_url(:put, content_type: filetype)

      {
        url: obj.public_url,
        upload_url: presigned_url
      }
    end
  end
end
