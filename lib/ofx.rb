require "open-uri"
require "nokogiri"
require "bigdecimal"

require "kconv"

require "ofx/errors"
require "ofx/parser"
require "ofx/parser/ofx102"
require "ofx/parser/ofx103"
require "ofx/parser/ofx211"
require "ofx/parser/ofx220"
require "ofx/foundation"
require "ofx/balance"
require "ofx/account"
require "ofx/sign_on"
require "ofx/statement"
require "ofx/status"
require "ofx/transaction"
require "ofx/version"
require "ofx/account_info"
require "ofx/credit_card_closing_info"

def OFX(resource, &block)
  parser = OFX::Parser::Base.new(resource).parser

  if block_given?
    if block.arity == 1
      yield parser
    else
      parser.instance_eval(&block)
    end
  end

  parser
end
