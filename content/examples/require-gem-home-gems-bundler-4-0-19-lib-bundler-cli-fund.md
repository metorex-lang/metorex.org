---
title: "require/gem_home/gems/bundler-4.0.19/lib/bundler/cli/fund.rb"
slug: require-gem-home-gems-bundler-4-0-19-lib-bundler-cli-fund
description: "The metorex example program require/gem_home/gems/bundler-4.0.19/lib/bundler/cli/fund.rb and its output."
---

`tests/_examples/require/gem_home/gems/bundler-4.0.19/lib/bundler/cli/fund.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/require/gem_home/gems/bundler-4.0.19/lib/bundler/cli/fund.rb){target=_blank rel=noopener}.

```metorex
# frozen_string_literal: true

module Bundler
  class CLI::Fund
    attr_reader :options

    def initialize(options)
      @options = options
    end

    def run
      Bundler.definition.validate_runtime!

      groups = Array(options[:group]).map(&:to_sym)

      deps = if groups.any?
        Bundler.definition.dependencies_for(groups)
      else
        Bundler.definition.requested_dependencies
      end

      fund_info = deps.each_with_object([]) do |dep, arr|
        spec = Bundler.definition.specs[dep.name].first
        if spec.metadata.key?("funding_uri")
          arr << "* #{spec.name} (#{spec.version})\n  Funding: #{spec.metadata["funding_uri"]}"
        end
      end

      if fund_info.empty?
        Bundler.ui.info "None of the installed gems you directly depend on are looking for funding."
      else
        Bundler.ui.info fund_info.join("\n")
      end
    end
  end
end
```
