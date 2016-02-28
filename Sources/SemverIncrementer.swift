class SemverIncrementer {
    func usage() {
        print("usage: origin-version $incrementBy")
        print("e.g. semver-incrementer 0.6.6 9")
    }

    func run(args: [String]) {
        guard args.count > 2 else {
            useGit()
            return
        }
        useInput(args)
        exit(0)
    }

    func useInput(args: [String]) {
        describe(args[1], incrementBy: args[2])
    }

    func describe(originVersion: String, incrementBy: String) {
        guard let version = Semver.fromString(originVersion.trim()) else {
            print("error:\(originVersion):not a valid version")
            return
        }

        guard let by = Int(incrementBy) else {
            print("error:\(incrementBy) is not a valid increment value")
            return
        }
        print(version.increment(by).short)
    }

    func useGit() {
        guard let git = Git(path:"/usr/bin/git") else {
            usage()
            return
        }
        guard let version = git.lastTag as? String else {
            print("error: no version")
            return
        }
        describe(version, incrementBy: "1")
    }
}
