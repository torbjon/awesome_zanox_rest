module AwesomeZanox
  class Publisher < InstanceResource
    # https://developer.zanox.com/web/guest/publisher-api-2011/get-profiles
    def profiles
      request(url: 'profiles')
    end

    # https://developer.zanox.com/web/guest/publisher-api-2011/get-adspaces
    def adspaces(opts = {})
      request(url: 'adspaces', params: opts)
    end

    # https://developer.zanox.com/web/guest/publisher-api-2011/get-adspaces-adspace
    def adspace(id)
      request(url: "adspaces/adspace/#{id}")
    end

    # https://developer.zanox.com/web/guest/publisher-api-2011/get-admedia
    def admedia(opts = {})
      request(url: 'admedia', params: opts)
    end

    # https://developer.zanox.com/web/guest/publisher-api-2011/get-programs
    def programs(opts = {})
      request(url: 'programs', params: opts)
    end

    # https://developer.zanox.com/web/guest/publisher-api-2011/get-programs-program
    def program(id)
      request(url: "programs/program/#{id}")
    end

    # https://developer.zanox.com/web/guest/publisher-api-2011/get-programapplications
    def programapplications(opts = {})
      request(url: 'programapplications', params: opts)
    end
  end
end
