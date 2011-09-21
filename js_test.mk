# Nasty, hard-coded list of dependencies inherited by every JS test.
JS_TEST_DEPS := \
    $(PROJECT_ROOT)/gjstest/internal/namespace.js \
    $(PROJECT_ROOT)/gjstest/internal/driver/error_utils.js \
    $(PROJECT_ROOT)/gjstest/internal/driver/stack_utils.js \
    $(PROJECT_ROOT)/gjstest/internal/driver/test_environment.js \
    $(PROJECT_ROOT)/gjstest/public/matcher_types.js \
    $(PROJECT_ROOT)/gjstest/public/matchers/number_matchers.js \
    $(PROJECT_ROOT)/gjstest/internal/driver/browser/html_builder.js \
    $(PROJECT_ROOT)/gjstest/internal/assertions/expect_that.js \
    $(PROJECT_ROOT)/gjstest/public/matchers/boolean_matchers.js \
    $(PROJECT_ROOT)/gjstest/public/matchers/equality_matchers.js \
    $(PROJECT_ROOT)/gjstest/internal/mocking/call_expectation.js \
    $(PROJECT_ROOT)/gjstest/internal/mocking/mock_function.js \
    $(PROJECT_ROOT)/gjstest/internal/mocking/mock_instance.js \
    $(PROJECT_ROOT)/gjstest/public/stringify.js \
    $(PROJECT_ROOT)/gjstest/public/assertions.js \
    $(PROJECT_ROOT)/gjstest/public/mocking.js \
    $(PROJECT_ROOT)/gjstest/public/register.js \
    $(PROJECT_ROOT)/gjstest/internal/driver/run_test.js \
    $(PROJECT_ROOT)/gjstest/internal/driver/browser/driver.js \
    $(PROJECT_ROOT)/gjstest/public/logging.js \
    $(PROJECT_ROOT)/gjstest/public/matchers/array_matchers.js \
    $(PROJECT_ROOT)/gjstest/public/matchers/function_matchers.js \
    $(PROJECT_ROOT)/gjstest/public/matchers/string_matchers.js \
    $(PROJECT_ROOT)/gjstest/internal/use_global_namespace.js

define add_js_test
$(1) : $(PROJECT_ROOT)/$(PACKAGE)/$(1).js $(JS_TEST_DEPS) $(PROJECT_ROOT)/bin/gjstest
	$(PROJECT_ROOT)/bin/gjstest --js_files=`echo "$(JS_TEST_DEPS) $(PROJECT_ROOT)/$(PACKAGE)/$(1).js" | perl -i -pe 's: :,:g'`

JS_TESTS += $(1)
endef