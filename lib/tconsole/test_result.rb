module TConsole
  class TestResult
    # The number of failed tests in the last run
    attr_accessor :failures

    # The number of errors that occurred in the last run
    attr_accessor :errors

    # The number of skipped tests
    attr_accessor :skips

    # Details about the failures in the last run
    attr_accessor :failure_details

    # The suites that we've run
    attr_accessor :suites

    # The timings for the tests we've run
    attr_accessor :timings

    def initialize
      self.failures = 0
      self.errors = 0
      self.skips = 0
      self.failure_details = []
      self.suites = {}
      self.timings = []
    end

    # Adds to the failure details that we know about
    def append_failure_details(klass, meth)
      self.failure_details << { :class => klass.to_s, :method => meth.to_s }
    end

    # Records that we've encountered a particular suite. Returns true
    # if it's new or false otherwise.
    def add_suite(suite)
      if suites.has_key?(suite.to_s)
        false
      else
        suites[suite.to_s] = true
        true
      end
    end

    def add_timing(suite, method, time)
      self.timings << { :suite => suite.to_s, :method => method.to_s, :time => time }
    end
  end
end
