
module Elastomer
  class Client

    class Cluster

      # Create a new cluster client for making API requests that pertain to
      # the cluster health and management.
      #
      # client - Elastomer::Client used for HTTP requests to the server
      #
      def initialize( client )
        @client = client
      end

      attr_reader :client

      # Simple status on the health of the cluster.
      # See http://www.elasticsearch.org/guide/reference/api/admin-cluster-health/
      #
      # params - Parameters Hash
      #
      # Returns the response as a Hash
      def health( params = {} )
        response = client.get '/_cluster/health{/index}', params
        response.body
      end

      # Comprehensive state information of the whole cluster.
      # See http://www.elasticsearch.org/guide/reference/api/admin-cluster-state/
      #
      # params - Parameters Hash
      #
      # Returns the response as a Hash
      def state( params = {} )
        response = client.get '/_cluster/state', params
        response.body
      end

      # Cluster wide settings that have been modifed via the update API.
      # See http://www.elasticsearch.org/guide/reference/api/admin-cluster-update-settings/
      #
      # params - Parameters Hash
      #
      # Returns the response as a Hash
      def settings( params = {} )
        response = client.get '/_cluster/settings', params
        response.body
      end

      # Update cluster wide specific settings. Settings updated can either be
      # persistent (applied cross restarts) or transient (will not survive a
      # full cluster restart).
      #
      # See http://www.elasticsearch.org/guide/reference/api/admin-cluster-update-settings/
      #
      # params - Parameters Hash
      #
      # Returns the response as a Hash
      def update_settings( params = {} )
        response = client.put '/_cluster/settings', params
        response.body
      end

      # Explicitly execute a cluster reroute allocation command. For example,
      # a shard can be moved from one node to another explicitly, an
      # allocation can be canceled, or an unassigned shard can be explicitly
      # allocated on a specific node.
      #
      # See http://www.elasticsearch.org/guide/reference/api/admin-cluster-reroute/
      #
      # params - Parameters Hash
      #
      # Returns the response as a Hash
      def reroute( params = {} )
        response = client.post '/_cluster/reroute', params
        response.body
      end

      # Shutdown the entire cluster.
      # See http://www.elasticsearch.org/guide/reference/api/admin-cluster-nodes-shutdown/
      #
      # params - Parameters Hash
      #
      # Returns the response as a Hash
      def shutdown( params = {} )
        response = client.post '/_shutdown', params
        response.body
      end
    end  # Cluster

    # Returns a Cluster instance.
    def cluster
      @cluster ||= Cluster.new self
    end

  end  # Client
end  # Elastomer
