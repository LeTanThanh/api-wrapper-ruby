require "spec_helper"

RSpec.describe Uiza::Entity do
  before(:each) do
    Uiza.app_id = "your-app-id"
    Uiza.authorization = "your-authorization"
  end

  describe "::update" do
    context "API returns code 200" do
      it "should returns an entity" do
        params = {
          id: "your-entity-id",
          name: "Sample video editted"
        }

        # update entity
        expected_method_1 = :put
        expected_url_1 = "https://ap-southeast-1-api.uiza.co/api/public/v4/media/entity"
        expected_headers_1 = {"Authorization" => "your-authorization"}
        expected_body_1 = params.merge("appId" => "your-app-id")
        mock_response_1 = {
          data: {
            id: "your-entity-id"
          },
          code: 200
        }

        stub_request(expected_method_1, expected_url_1)
          .with(headers: expected_headers_1, body: expected_body_1)
          .to_return(body: mock_response_1.to_json)

        # retrieve entity with id = "your-entity-id"
        expected_method_2 = :get
        expected_url_2 = "https://ap-southeast-1-api.uiza.co/api/public/v4/media/entity"
        expected_headers_2 = {"Authorization" => "your-authorization"}
        expected_query_2 = {id: "your-entity-id", appId: "your-app-id"}
        mock_response_2 = {
          data: {
            id: "your-entity-id",
            name: "Sample video editted",
            embedMetadata: {
              artist: "John Doe",
              album: "Album sample",
              genre: "Pop"
            }
          },
          code: 200
        }

        stub_request(expected_method_2, expected_url_2)
          .with(headers: expected_headers_2, query: expected_query_2)
          .to_return(body: mock_response_2.to_json)

        entity = Uiza::Entity.update params

        expect(entity.id).to eq "your-entity-id"
        expect(entity.name).to eq "Sample video editted"
        expect(entity.embedMetadata.artist).to eq "John Doe"
        expect(entity.embedMetadata.album).to eq "Album sample"
        expect(entity.embedMetadata.genre).to eq "Pop"

        expect(WebMock).to have_requested(expected_method_1, expected_url_1)
          .with(headers: expected_headers_1, body: expected_body_1)
      end
    end

    context "API returns code 400" do
      it "should raise BadRequestError" do
        api_return_error_code 400, Uiza::Error::BadRequestError
      end
    end

    context "API returns code 401" do
      it "should raise UnauthorizedError" do
        api_return_error_code 401, Uiza::Error::UnauthorizedError
      end
    end

    context "API returns code 404" do
      it "should raise NotFoundError" do
        api_return_error_code 404, Uiza::Error::NotFoundError
      end
    end

    context "API returns code 422" do
      it "should raise UnprocessableError" do
        api_return_error_code 422, Uiza::Error::UnprocessableError
      end
    end

    context "API returns code 500" do
      it "should raise InternalServerError" do
        api_return_error_code 500, Uiza::Error::InternalServerError
      end
    end

    context "API returns code 503" do
      it "should raise ServiceUnavailableError" do
        api_return_error_code 503, Uiza::Error::ServiceUnavailableError
      end
    end

    context "API returns code 4xx (example 456)" do
      it "should raise ClientError" do
        api_return_error_code 456, Uiza::Error::ClientError
      end
    end

    context "API returns code 5xx (example 567)" do
      it "should raise ServerError" do
        api_return_error_code 567, Uiza::Error::ServerError
      end
    end

    context "API returns unknow code (example 345)" do
      it "should raise UizaError" do
        api_return_error_code 345, Uiza::Error::UizaError
      end
    end

    def api_return_error_code error_code, error_class
      params = {
        key: "invalid-value"
      }

      expected_method = :put
      expected_url = "https://ap-southeast-1-api.uiza.co/api/public/v4/media/entity"
      expected_headers = {"Authorization" => "your-authorization"}
      expected_body = params.merge("appId" => "your-app-id")
      mock_response = {
        code: error_code,
        message: "error message"
      }

      stub_request(expected_method, expected_url)
        .with(headers: expected_headers, body: expected_body)
        .to_return(body: mock_response.to_json)

      expect{Uiza::Entity.update params}.to raise_error do |error|
        expect(error).to be_a error_class
        expect(error.description_link).to eq "https://docs.uiza.io/v4/#update-an-entity"
        expect(error.code).to eq error_code
        expect(error.message).to eq "error message"
      end

      expect(WebMock).to have_requested(expected_method, expected_url)
        .with(headers: expected_headers, body: expected_body)
    end
  end
end
