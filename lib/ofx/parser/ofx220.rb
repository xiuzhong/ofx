module OFX
  module Parser
    class OFX220 < OFX211
      VERSION = "2.2.0"

      def accounts_info
        @accounts_info ||= html.search('acctinfo').collect { |node| build_account_info(node) }
      end

      private

      def build_account_info(node)
        nested_account_info = node.search('bankacctfrom, ccacctfrom')
        OFX::AccountInfo.new({
          name:              node.search('name').inner_text,
          description:       node.search('desc').inner_text.upcase,
          bank_id:           nested_account_info.search('bankid').inner_text,
          id:                nested_account_info.search('acctid').inner_text,
          type:              nested_account_info.search('accttype').inner_text.upcase
        })
      end
    end
  end
end
