module Uiza
  module APIOperation
    module Delete
      def delete id
        url = "https://#{Uiza.workspace_api_domain}/api/public/#{Uiza.api_version}/#{self::OBJECT_API_PATH}"
        method = :delete
        headers = {"Authorization" => Uiza.authorization}
        params = {id: id, appId: Uiza.app_id}

        uiza_client = UizaClient.new url, method, headers, params, self::OBJECT_API_DESCRIPTION_LINK[:delete]
        uiza_client.execute_request
      end
    end
  end
end