# containerofuniqueentries-doc

Documentation site for the [containerofuniqueentries](https://github.com/hjiangcpp/containerofuniqueentries) C++ library, built with Jekyll and hosted on GitHub Pages.

## About the library

**Container of Unique Entries** provides two sequence containers that maintain uniqueness of elements using an internal hash set:

- **`vector_of_unique`** — a sequence container backed by `std::vector` that guarantees all elements are unique. Supports random access and efficient lookup.
- **`deque_of_unique`** — a sequence container backed by `std::deque` that guarantees all elements are unique. Supports efficient insertion and removal at both ends.

Both containers offer an interface similar to their standard library counterparts, while silently skipping duplicate insertions to maintain the uniqueness invariant.

## Viewing the documentation

The documentation is published at: https://hjiangcpp.github.io/containerofuniqueentries-doc/

## Building locally

Prerequisites: Ruby, Bundler

```bash
bundle install
bundle exec jekyll serve
```

Then open `http://localhost:4000` in your browser.

## License

See [LICENSE](LICENSE).
