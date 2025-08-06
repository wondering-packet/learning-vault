#### **What it is:**

A Git tag is a static, human-readable pointer to a specific commit. Unlike a branch, which is a moving pointer that automatically advances with new commits, a tag is fixed. It acts as a permanent bookmark for a specific point in your project's history, making it easy to reference key moments like a product release. **Tags are global across the entire repository**, pointing to a specific commit regardless of which branch you are on. They are not part of a branch's history, but rather a universal reference visible from any part of the repository.

#### **Purpose:**

Tags are primarily used to mark significant milestones in a project's history. They give a memorable name to a specific commit, which is much easier to reference than a long, unintelligible commit hash. The most common use case is to mark versions or releases. This allows you to easily find the exact state of the code that was used for version `v1.0.0`, for example.

#### **Real world application:**

In a continuous integration and deployment (CI/CD) pipeline, tags are often used to trigger a build or deployment process. For example, a developer might finish a feature and prepare the project for a new release. By running `git tag v2.1.0` and pushing it to the remote repository, a CI/CD system can detect this new tag, automatically build a new container image, run tests, and deploy the new version of the application to production.

#### **Example Commands:**

- **To list all tags:**

    ```bash
    git tag
    ```

- **To create a new tag:**

    ```bash
    # Create a lightweight tag (a simple pointer)
    git tag v1.0.0
    
    # Create an annotated tag (recommended) with a message
    git tag -a v1.0.0 -m "Release version 1.0.0"
    ```

- **To push a tag to a remote repository:**

    ```bash
    # Push a single tag
    git push origin v1.0.0
    
    # Push all local tags
    git push origin --tags
    ```

- **To delete a tag:**

    ```bash
    # Delete a local tag
    git tag -d v1.0.0
    
    # Delete a remote tag (two ways)
    git push origin --delete v1.0.0
    # OR
    git push origin :v1.0.0
    ```