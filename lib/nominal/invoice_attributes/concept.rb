module Nominal
  module InvoiceAttributes
    class Concept
      include Properties

      has_properties :quantity,
                    :unit,
                    :description,
                    :unit_value,
                    :amount,
                    :identification_number

      def to_xml(xml, precision = 2)

        concept_attr = {}
        concept_attr[:cantidad] = self.quantity
        concept_attr[:unidad] = self.unit
        concept_attr[:descripcion] = self.description
        concept_attr[:valorUnitario] = MoneyUtils.number_to_rounded_precision(self.unit_value, precision)
        concept_attr[:importe] = MoneyUtils.number_to_rounded_precision(self.amount, precision)

        unless self.identification_number.nil?
          unless self.identification_number.empty?
            concept_attr[:noIdentificacion] = self.identification_number
          end
        end

        xml.Concepto(concept_attr) {
        }

        xml

      end

    end
  end
end