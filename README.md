# @accessprotocol/tokenizers

The official Node bindings are in a jinx with limited support for Node versions and architectures. This package offers multi-arch bindings for [@huggingface/tokenizers](https://github.com/huggingface/tokenizers) with Node v20.x supported. 

## Supports:
> * Windows x86_64
> * Linux x86_64
> * Linux aarch64 (ARM64)
> * MacOS aarch64/x86_64

## Installation

```bash
npm install @accessprotocol/tokenizers
```

## Features

 - Train new vocabularies and tokenize using 4 pre-made tokenizers (Bert WordPiece and the 3
   most common BPE versions).
 - Extremely fast (both training and tokenization), thanks to the Rust implementation. Takes
   less than 20 seconds to tokenize a GB of text on a server's CPU.
 - Easy to use, but also extremely versatile.
 - Designed for research and production.
 - Normalization comes with alignments tracking. It's always possible to get the part of the
   original sentence that corresponds to a given token.
 - Does all the pre-processing: Truncate, Pad, add the special tokens your model needs.


## Basic example

```ts
import { Tokenizer } from "@accessprotocol/tokenizers";

const tokenizer = await Tokenizer.fromFile("tokenizer.json");
const wpEncoded = await tokenizer.encode("Who is John?");

console.log(wpEncoded.getLength());
console.log(wpEncoded.getTokens());
console.log(wpEncoded.getIds());
console.log(wpEncoded.getAttentionMask());
console.log(wpEncoded.getOffsets());
console.log(wpEncoded.getOverflowing());
console.log(wpEncoded.getSpecialTokensMask());
console.log(wpEncoded.getTypeIds());
console.log(wpEncoded.getWordIds());
```

## Development

### Prerequisites

- [Rust](https://rustup.rs/) with `cargo`
- [Node.js](https://nodejs.org/) >= 10
- [Yarn](https://yarnpkg.com/)

### Building for ARM64 Linux

To build for ARM64 Linux, you need to install the cross-compilation target:

```bash
# Install the ARM64 Linux target
rustup target add aarch64-unknown-linux-gnu

# Build for ARM64 Linux
yarn build --target aarch64-unknown-linux-gnu
```

### Cross-compilation setup

For cross-compilation to work properly, you may need to install additional tools:

**On Ubuntu/Debian:**
```bash
sudo apt-get install gcc-aarch64-linux-gnu
```

**On macOS:**
```bash
brew install filosottile/musl-cross/musl-cross
```

## License

[MIT](LICENSE)
