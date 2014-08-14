module AwesomeZanox
  class Publisher < InstanceResource
    def profiles
      request({ url: 'profiles' })
    end

    def adspaces(opts={})
      request({ url: 'adspaces', params: opts })
    end

    def adspace(id)
      request({ url: "adspaces/adspace/#{id}" })
    end

    def admedia(opts={})
      request({ url: 'admedia', params: opts })
    end
  end
end