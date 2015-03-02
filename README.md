# RunItBack

Easily rerun failing tests from rspec by copying the last line of this formatter.
Will work easily with other rspec formatters.

## Installation

Add this line to your application's `Gemfile`:

```ruby
gem 'run_it_back'
```

## Example Usage

In your `.rspec` file:

```
--format RunItBack
```

When 10 or less failures occur:
```
Rerun all failed examples:

rspec ./spec/models/model_one_spec.rb:{5,8} ./spec/models/model_two_spec.rb:{5,8}
```

When more than 10 failures occur in 10 or less files:
```
Rerun all files containing failures:

rspec ./spec/models/model_one_spec.rb ./spec/models/model_two_spec.rb
```
## License

MIT
