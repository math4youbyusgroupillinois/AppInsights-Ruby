require_relative '../../../../lib/application_insights/channel/contracts/remote_dependency_data'
require 'test/unit'

include ApplicationInsights::Channel

class TestRemoteDependencyData < Test::Unit::TestCase
  def test_initialize
    item = Contracts::RemoteDependencyData.new
    assert_not_nil item
  end
  
  def test_ver_works_as_expected
    expected = 42
    item = Contracts::RemoteDependencyData.new
    item.ver = expected
    actual = item.ver
    assert_equal expected, actual
    expected = 13
    item.ver = expected
    actual = item.ver
    assert_equal expected, actual
  end
  
  def test_name_works_as_expected
    expected = 'Test string'
    item = Contracts::RemoteDependencyData.new
    item.name = expected
    actual = item.name
    assert_equal expected, actual
    expected = 'Other string'
    item.name = expected
    actual = item.name
    assert_equal expected, actual
  end
  
  def test_kind_works_as_expected
    expected = { 'key' => 'value' }
    item = Contracts::RemoteDependencyData.new
    item.kind = expected
    actual = item.kind
    assert_equal expected, actual
    expected = { 'key' => 'value' }
    item.kind = expected
    actual = item.kind
    assert_equal expected, actual
  end
  
  def test_value_works_as_expected
    expected = 1.5
    item = Contracts::RemoteDependencyData.new
    item.value = expected
    actual = item.value
    assert_equal expected, actual
    expected = 4.8
    item.value = expected
    actual = item.value
    assert_equal expected, actual
  end
  
  def test_count_works_as_expected
    expected = 42
    item = Contracts::RemoteDependencyData.new
    item.count = expected
    actual = item.count
    assert_equal expected, actual
    expected = 13
    item.count = expected
    actual = item.count
    assert_equal expected, actual
  end
  
  def test_min_works_as_expected
    expected = 1.5
    item = Contracts::RemoteDependencyData.new
    item.min = expected
    actual = item.min
    assert_equal expected, actual
    expected = 4.8
    item.min = expected
    actual = item.min
    assert_equal expected, actual
  end
  
  def test_max_works_as_expected
    expected = 1.5
    item = Contracts::RemoteDependencyData.new
    item.max = expected
    actual = item.max
    assert_equal expected, actual
    expected = 4.8
    item.max = expected
    actual = item.max
    assert_equal expected, actual
  end
  
  def test_std_dev_works_as_expected
    expected = 1.5
    item = Contracts::RemoteDependencyData.new
    item.std_dev = expected
    actual = item.std_dev
    assert_equal expected, actual
    expected = 4.8
    item.std_dev = expected
    actual = item.std_dev
    assert_equal expected, actual
  end
  
  def test_dependency_kind_works_as_expected
    expected = { 'key' => 'value' }
    item = Contracts::RemoteDependencyData.new
    item.dependency_kind = expected
    actual = item.dependency_kind
    assert_equal expected, actual
    expected = { 'key' => 'value' }
    item.dependency_kind = expected
    actual = item.dependency_kind
    assert_equal expected, actual
  end
  
  def test_success_works_as_expected
    expected = TRUE
    item = Contracts::RemoteDependencyData.new
    item.success = expected
    actual = item.success
    assert_equal expected, actual
    expected = FALSE
    item.success = expected
    actual = item.success
    assert_equal expected, actual
  end
  
  def test_async_works_as_expected
    expected = TRUE
    item = Contracts::RemoteDependencyData.new
    item.async = expected
    actual = item.async
    assert_equal expected, actual
    expected = FALSE
    item.async = expected
    actual = item.async
    assert_equal expected, actual
  end
  
  def test_dependency_source_works_as_expected
    expected = { 'key' => 'value' }
    item = Contracts::RemoteDependencyData.new
    item.dependency_source = expected
    actual = item.dependency_source
    assert_equal expected, actual
    expected = { 'key' => 'value' }
    item.dependency_source = expected
    actual = item.dependency_source
    assert_equal expected, actual
  end
  
  def test_properties_works_as_expected
    item = Contracts::RemoteDependencyData.new
    actual = item.properties
    assert_not_nil actual
  end
  
  def test_to_json_works_as_expected
    item = Contracts::RemoteDependencyData.new
    item.ver = 42
    item.name = 'Test string'
    item.kind = { 'key' => 'value' }
    item.value = 1.5
    item.count = 42
    item.min = 1.5
    item.max = 1.5
    item.std_dev = 1.5
    item.dependency_kind = { 'key' => 'value' }
    item.success = TRUE
    item.async = TRUE
    item.dependency_source = { 'key' => 'value' }
    { 'key1' => 'test value 1' , 'key2' => 'test value 2' }.each do |key, value|
      item.properties[key] = value
    end
    actual = item.to_json
    expected = '{"ver":42,"name":"Test string","kind":{"key":"value"},"value":1.5,"count":42,"min":1.5,"max":1.5,"stdDev":1.5,"dependencyKind":{"key":"value"},"success":true,"async":true,"dependencySource":{"key":"value"},"properties":{"key1":"test value 1","key2":"test value 2"}}'
    assert_equal expected, actual
  end
end
