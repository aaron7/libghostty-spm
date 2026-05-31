//
//  TerminalSurfaceOptions.swift
//  libghostty-spm
//
//  Created by Lakr233 on 2026/3/16.
//

import GhosttyKit

public struct TerminalSurfaceOptions: Sendable {
    public var backend: TerminalSessionBackend
    public var fontSize: Float?
    public var workingDirectory: String?
    public var command: String?
    public var environment: [String: String]
    public var context: TerminalSurfaceContext

    public init(
        backend: TerminalSessionBackend = .exec,
        fontSize: Float? = nil,
        workingDirectory: String? = nil,
        command: String? = nil,
        environment: [String: String] = [:],
        context: TerminalSurfaceContext = .window
    ) {
        self.backend = backend
        self.fontSize = fontSize
        self.workingDirectory = workingDirectory
        self.command = command
        self.environment = environment
        self.context = context
    }

    func isEquivalent(to other: TerminalSurfaceOptions) -> Bool {
        fontSize == other.fontSize
            && workingDirectory == other.workingDirectory
            && command == other.command
            && environment == other.environment
            && context == other.context
            && backend.isEquivalent(to: other.backend)
    }

    var inMemorySession: InMemoryTerminalSession? {
        guard case let .inMemory(session) = backend else { return nil }
        return session
    }
}
