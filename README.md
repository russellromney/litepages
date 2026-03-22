# litepages

LTX (Lite Transaction) format encoding/decoding for SQLite page-level replication.

Fork of [superfly/ltx-rs](https://github.com/superfly/ltx-rs) with Litestream compatibility fixes.

## Features

- Encode/decode SQLite pages to LTX format
- Compatible with Litestream backups
- Supports `NO_CHECKSUM` flag for Litestream compatibility
- LZ4 compression support

## Usage

Used by [walrust](https://github.com/russellromney/walrust) for SQLite WAL replication to S3/Tigris.

```toml
[dependencies]
litepages = "0.1.0"
```

## Changes from upstream

- Added `NO_CHECKSUM` flag (0x02) support for reading Litestream-produced LTX files
- Updated header validation to skip checksum checks when NO_CHECKSUM is set

## Why fork?

Litestream uses `HeaderFlagNoChecksum = 0x00000002` for files that don't track checksums.
The upstream litetx crate only recognizes `COMPRESS_LZ4 = 0x01`, causing decode failures.

This fork enables reading Litestream backups for migration purposes.

## License

Apache-2.0
