require File.dirname(__FILE__) + "/../test_helper"

Expectations do
  expect true do
    Expectations::XmlString.new("<foo>bar</foo>").expectations_equal_to "<foo>bar</foo>"
  end

  expect true do
    Expectations::XmlString.new("<foo>bar</foo>").expectations_equal_to "  <foo>bar</foo>  "
  end

  expect true do
    Expectations::XmlString.new("  <foo>bar</foo>  ").expectations_equal_to "<foo>bar</foo>"
  end

  expect true do
    Expectations::XmlString.new("<foo>bar</foo>").expectations_equal_to "<foo>bar</foo>\n"
  end

  expect true do
    Expectations::XmlString.new("\n<foo>bar</foo>").expectations_equal_to "<foo>bar</foo>"
  end

  expect true do
    Expectations::XmlString.new("\t<foo>bar</foo>").expectations_equal_to "<foo>bar</foo>"
  end

  expect true do
    Expectations::XmlString.new("<foo>bar</foo>").expectations_equal_to "<foo>bar</foo>\t"
  end

  expect true do
    Expectations::XmlString.new("<a>\n<foo>bar</foo>").expectations_equal_to "<a><foo>bar</foo>"
  end

  expect true do
    Expectations::XmlString.new("<a>\n<foo>\t \n bar</foo>").expectations_equal_to "<a><foo>\t \n bar</foo>"
  end

  expect true do
    Expectations::XmlString.new("<a>\n<foo>\t \n bar</foo>\n \t </a>").expectations_equal_to "<a><foo>\t \n bar</foo></a>"
  end

end