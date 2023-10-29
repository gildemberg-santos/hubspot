# frozen_string_literal: true

require "u-case"
require "httparty"
require_relative "hubspot/version"
require_relative "hubspot/request"
require_relative "hubspot/contact/create"
require_relative "hubspot/contact/find"
require_relative "hubspot/contact/property"
require_relative "hubspot/contact/update"
require_relative "hubspot/deal/association"
require_relative "hubspot/deal/create"
require_relative "hubspot/deal/property"

module Hubspot; end
