module AnetworkDynamicAd

  class Client

    # setter and getter
    attr_accessor :url , :toke , :api_url , :request

    ##
    # Set token
    #
    # @author Alireza Josheghani <a.josheghani@anetwork.ir>
    # @since 24 Nov 2016
    # @param [string] token
    # @return [void]
    def initialize(token)
      @api_url = 'http://api.anetwork.ir/dynamicad/'
      @token = token
    end

    ##
    # Get products
    #
    # @author Alireza Josheghani <a.josheghani@anetwork.ir>
    # @since 24 Nov 2016
    # @return [Object]
    def product
      @url = "#{@api_url}?token=#{@token}"
      self
    end

    ##
    # Get logos
    #
    # @author Alireza Josheghani <a.josheghani@anetwork.ir>
    # @since 24 Nov 2016
    # @return [Object]
    def logo
      @url = "#{@api_url}logo?token=#{@token}"
      self
    end

    ##
    # Get by id
    #
    # @author Alireza Josheghani <a.josheghani@anetwork.ir>
    # @since 24 Nov 2016
    # @param [integer] id
    # @return [Object]
    def id(id)
      @url = "#{@url}&id=#{id}"
      self
    end

    ##
    # Set limit and offset
    #
    # @author Alireza Josheghani <a.josheghani@anetwork.ir>
    # @since 24 Nov 2016
    # @param [integer] limit
    # @param [integer] offset
    def limit(limit = 999,offset = 0)
      @url = "#{@url}&limit=#{limit}&offset=#{offset}"
      self
    end

    ##
    # Insert records
    #
    # @author Alireza Josheghani <a.josheghani@anetwork.ir>
    # @since 24 Nov 2016
    # @param [Object] params
    # @return [Json]
    def insert(params)
      puts Request.http(@url,'POST',params)
    end

    ##
    # Update records
    #
    # @author Alireza Josheghani <a.josheghani@anetwork.ir>
    # @since 24 Nov 2016
    # @param [Object] params
    # @return [Json]
    def update(params)
      params['_METHOD'] = 'PUT'
      puts Request.http(@url,'POST',params)
    end

    ##
    # Delete record
    #
    # @author Alireza Josheghani <a.josheghani@anetwork.ir>
    # @since 24 Nov 2016
    # @param [integer] id
    # @return [Json]
    def delete(id)
      params = {
          _METHOD: 'DELETE',
          id: id
      }
      puts Request.http(@url,'POST',params)
    end

    ##
    # Get results
    #
    # @author Alireza Josheghani <a.josheghani@anetwork.ir>
    # @since 24 Nov 2016
    # @return [json]
    def get
      puts Request.http(@url,'GET')
    end

  end

  class Request

    # require http librayr
    require 'net/http'

    def self.http(url,method,params = [])

      uri = URI.parse(url)
      http = Net::HTTP.new(uri.host, uri.port)

      if method == 'POST'
        request = Net::HTTP::Post.new(uri)
        request.set_form_data(params)
      else
        request = Net::HTTP::Get.new(uri)
      end

      response = http.request(request)
      response.body
    end

  end

end