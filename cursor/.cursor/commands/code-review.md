# code-review

/code-review [target-branch]: Review the changes between the current branch and the specified target branch (defaults to 'main' if not specified; can also use master, develop, etc.) and provide comprehensive feedback on:

### Code Quality and Readability

- Assess code structure, organization, and clarity
- Check naming conventions and consistency
- Evaluate code complexity and maintainability
- Identify opportunities for simplification or refactoring
- Review comments and documentation quality

### Potential Bugs or Issues

- Identify logic errors or edge cases not handled
- Check for race conditions or concurrency issues
- Look for memory leaks or resource management problems
- Verify error handling and exception management
- Spot null/undefined reference vulnerabilities
- Check for off-by-one errors and boundary conditions

### Security Considerations

- Identify potential injection vulnerabilities (SQL, XSS, etc.)
- Check for authentication and authorization issues
- Review data validation and sanitization
- Assess exposure of sensitive information
- Verify secure communication protocols
- Check for CSRF protection where needed
- Review dependency security and known vulnerabilities

### Best Practices Compliance

- Angular/TypeScript best practices and style guide adherence
- Proper use of observables and RxJS patterns
- Component lifecycle management
- State management patterns
- Testing coverage and quality
- Performance optimization opportunities
- Accessibility (a11y) compliance
- Proper typing and avoiding 'any' types

### Specific Suggestions

For each issue identified, provide:

- Location (file and line number if possible)
- Clear description of the issue
- Severity level (critical, high, medium, low)
- Specific recommendation for improvement
- Example code snippet when helpful

Focus on actionable feedback that improves code quality while respecting the existing architecture and patterns in the codebase.
