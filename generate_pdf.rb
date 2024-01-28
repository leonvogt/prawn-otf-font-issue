require "prawn"

FONT_NAME = "Gilroy"
FONT_TYPE = "otf" # otf or ttf

Prawn::Document.generate("test_pdf.pdf") do
  font_families.update(FONT_NAME => {
    normal: File.expand_path("radomir_tinkov_gilroy_regular.#{FONT_TYPE}", File.dirname(__FILE__)),
    bold: File.expand_path("radomir_tinkov_gilroy_bold.#{FONT_TYPE}", File.dirname(__FILE__)),
    italic: File.expand_path("radomir_tinkov_gilroy_italic.#{FONT_TYPE}", File.dirname(__FILE__)),
    bold_italic: File.expand_path("radomir_tinkov_gilroy_bold_italic.#{FONT_TYPE}", File.dirname(__FILE__))
  })

  font FONT_NAME
  font_size 20

  # this sample block works on .ttf fonts, but not on .otf fonts
  # with .otf fonts it shows weird characters instead of the text
  # (at least on the released version of Prawn 2.4.0 - on the master branch it seems to works)
  text "This is a test PDF asdf"
  text "This is a test PDF asdf", style: :bold
  text "This is a test PDF asdf", style: :italic
  text "This is a test PDF asdf", style: :bold_italic

  # this sample block with Umlaute is a bit different
  # with the released version of Prawn 2.4.0 it shows the Umlaute correctly (with .ttf and .otf fonts)
  # with the master branch of Prawn it shows the Umlaute only with the .ttf font (with .otf fonts it shows "NO GLYPH" instead of the Umlaute)
  text "ae -> ä"
  text "oe -> ö"
  text "ue -> ü"
end
