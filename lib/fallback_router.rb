require "fallback_router/engine"

module FallbackRouter
  class << self
  end
end

class ActionDispatch::Routing::Mapper

  # Synthesizes HTTP HEAD routes, by extending any GET routes in the route_set to also respond to HEAD.
  #
  # This works around a bug in Rails 4.x where if an engine is mounted at '/' that accepts a wildcard glob,
  # implicitly generated HEAD routes are not prioritized high enough in the routing table to be routed correctly,
  # and will be accidentally routed to the mounted engine instead of the application.
  #
  # @param route_set an ActionDispatch::Routing::RouteSet to modify
  #
  def synthesize_head_routes(route_set, options = {})
    route_set.routes.each { |r|
      constraint = r.constraints[:request_method]
      if constraint === "GET" && !(constraint === "HEAD")
        constraint_with_head = Regexp.compile(constraint.inspect.gsub(%r{/\^},'^').gsub(%r{\$/},'|HEAD$'))
        r.constraints[:request_method] = constraint_with_head
      end
    }
  end

end
