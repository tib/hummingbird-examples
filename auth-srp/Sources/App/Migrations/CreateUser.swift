//===----------------------------------------------------------------------===//
//
// This source file is part of the Hummingbird server framework project
//
// Copyright (c) 2021-2021 the Hummingbird authors
// Licensed under Apache License v2.0
//
// See LICENSE.txt for license information
// See hummingbird/CONTRIBUTORS.txt for the list of Hummingbird authors
//
// SPDX-License-Identifier: Apache-2.0
//
//===----------------------------------------------------------------------===//

import FluentKit

struct CreateUser: AsyncMigration {
    func prepare(on database: Database) async throws {
        return try await database.schema("user")
            .id()
            .field("name", .string, .required)
            .field("salt", .string, .required)
            .field("verifier", .string, .required)
            .create()
    }

    func revert(on database: Database) async throws {
        return try await database.schema("user").delete()
    }
}
