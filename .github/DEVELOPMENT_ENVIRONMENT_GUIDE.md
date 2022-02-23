# Development environment guide

## Preparing

Clone `truemail-rspec` repository:

```bash
git clone https://github.com/truemail-rb/truemail-rspec.git
cd  truemail-rspec
```

Configure latest Ruby environment:

```bash
echo 'ruby-3.1.1' > .ruby-version
cp .circleci/gemspec_latest truemail.gemspec
```

## Commiting

Commit your changes excluding `.ruby-version`, `truemail.gemspec`

```bash
git add . ':!.ruby-version' ':!truemail.gemspec'
git commit -m 'Your new awesome truemail feature'
```
