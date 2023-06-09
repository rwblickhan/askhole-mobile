alias l := lint

brew:
    brew install mint

mint: brew
    mint bootstrap

lint: mint
    mint run swiftformat . && mint run swiftlint
