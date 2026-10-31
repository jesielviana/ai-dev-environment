---
name: technology-php
description: Apply PHP engineering conventions when implementing, reviewing, debugging or testing PHP projects. Use only when the repository actually uses this technology.
---
# PHP workflow
1. Inspect manifests, source tree and existing CI before deciding versions or commands.
2. Follow existing architecture and avoid unrelated refactors.
3. Check: Composer, PHP version, PSR standards, dependency injection, PHPUnit, output escaping, prepared SQL, framework conventions.
4. Add focused tests; execute only commands supported by the repository.
5. Report exact verification performed and any unverified assumptions.
