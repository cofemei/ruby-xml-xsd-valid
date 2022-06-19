input_xml = "C0401_RY89485401_20220221120025_2.xml"
input_xml = "D0401_ECWW901966630001_20220224180022.xml"
xdf = "./xsd/v32/C0401.xsd"
xdf = "./xsd/v32/D0401.xsd"

require "rubygems"
require "nokogiri"
def validate(document_path, schema_path)
  p document_path
  p schema_path
  xsddoc = Nokogiri::XML(File.read(schema_path), schema_path)
  xsd = Nokogiri::XML::Schema.from_document(xsddoc)
  document = Nokogiri::XML(File.read(document_path))
  xsd.validate(document)
end

validate(input_xml, xdf).each do |error|
  puts error
  puts error.message
end
