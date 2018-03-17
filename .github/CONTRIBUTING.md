
:tada::tada::tada:First of all, thanks for taking the time to contribute and help make our project even better than it is today!

The following is a set of guidelines for contributing to Theme-Next and its packages, which are hosted in the [Next](https://github.com/theme-next) Organization on GitHub. These are mostly guidelines, not rules. Use your best judgment, and feel free to propose changes to this document in a pull request.

# Table Of Contents

[Code of Conduct](#code-of-conduct)

[How Can I Contribute?](#how-can-i-contribute)

  * [Reporting Bugs](#reporting-bugs)
  * [Suggesting Enhancements](#suggesting-enhancements)
  * [Submitting a Pull Request](#submitting-a-pull-request)

[Styleguides](#styleguides)

  * [Coding Rules](#coding-rules)
  * [Git Commit Messages](#git-commit-messages)
  * [Documentation Styleguide](#documentation-styleguide)

## How Can I Contribute?

Main repo was rebased from [iissnan's](https://github.com/iissnan/hexo-theme-next) profile to [theme-next](https://github.com/theme-next) organization. Most libraries under the `next/source/lib` directory was moved out to [external repos under NexT organization](https://github.com/theme-next).

If you just have a question, you'll get faster results by searching the detailed FAQ (Working in progress) or the [«NexT» Documentation Site](https://theme-next.org/docs/). Also, you can search for answers in reported [issue](https://github.com/theme-next/hexo-theme-next/issues?utf8=%E2%9C%93&q=).

If you find a bug in the source code, you can help us by
[Reporting Bugs](#reporting-bugs) or [Suggesting Enhancements](#suggesting-enhancements) to our [GitHub Repository](https://github.com/theme-next/hexo-theme-next). Even better, you can
[submit a Pull Request](#submitting-a-pull-request) with a fix.

### Reporting Bugs

This section guides you through submitting a bug report for Next. Following these guidelines helps maintainers and the community understand your report :pencil:, reproduce the behavior :computer: , and find related reports :mag_right:.

Before creating bug reports, please check [this list](#before-submitting-a-bug-report) as you might find out that you don't need to create one.

When you are creating a bug report, please [include as many details as possible](#how-do-i-submit-a-bug-report). Fill out [the required template](ISSUE_TEMPLATE.md), the information it asks for helps us resolve issues faster.

> **Note:** If you find a **Closed** issue that seems like it is the same thing that you're experiencing, open a new issue and include a link to the original issue in the body of your new one.

#### Before Submitting A Bug Report

* **Perform a  [cursory search](https://github.com/theme-next/hexo-theme-next/issues?utf8=%E2%9C%93&q=)** to see if the problem has already been reported. You might be able to find the cause of the problem and fix things yourself. If it has **and the issue is still open**, add a comment to the existing issue instead of opening a new one. Most importantly, check if you can reproduce the problem [in the latest release version of Next](https://github.com/theme-next/hexo-theme-next/releases/latest).
* **Check the FAQs** (Working in progress) for a list of common questions and problems.

#### How Do I Submit A Bug Report?

Bugs are tracked as [GitHub issues](https://guides.github.com/features/issues/). After you've determined the repository your bug is related to, create an issue on that repository and provide the following information by filling in [the template](ISSUE_TEMPLATE.md).

Explain the problem and include additional details to help maintainers reproduce the problem:

* **Use a clear and descriptive title** for the issue to identify the problem.
* **Describe the exact steps which reproduce the problem** in as many details as possible. When listing steps, **don't just say what you did, but explain how you did it**, e.g. which command exactly you used.
* **Provide specific examples to demonstrate the steps**. Include links to files or GitHub projects, or copy/pasteable snippets, which you use in those examples. If you're providing snippets in the issue, use [Markdown code blocks](https://help.github.com/articles/creating-and-highlighting-code-blocks/) or [a permanent link to a code snippet](https://help.github.com/articles/creating-a-permanent-link-to-a-code-snippet/), or a [gist link](https://gist.github.com/).
* **Describe the behavior you observed after following the steps** and point out what exactly is the problem with that behavior.
* **Explain which behavior you expected to see instead and why.**
* **Include screenshots and animated GIFs** which show you following the described steps and clearly demonstrate the problem. You can use [licecap](https://www.cockos.com/licecap/) to record GIFs on macOS and Windows, and [silentcast](https://github.com/colinkeenan/silentcast) or [byzanz](https://github.com/GNOME/byzanz) on Linux. Then [attach the file](https://help.github.com/articles/file-attachments-on-issues-and-pull-requests/) to an issue or pull request conversation, drag and drop it into the comment box.

Provide more context by answering these questions:

* **Can you reproduce the problem?**
* **Did the problem start happening recently** (e.g. after updating to a new version of Next) or was this always a problem?
* If the problem started happening recently, **can you reproduce the problem in an older version of Next?** What's the most recent version in which the problem doesn't happen? You can download older versions of Next from [the releases page](https://github.com/theme-next/hexo-theme-next/releases).
* **Can you reliably reproduce the issue?** If not, provide details about how often the problem happens and under which conditions it normally happens.
* If the problem is related to working with files (e.g. opening and editing files), **does the problem happen for all files and projects or only some?** Does the problem happen only when working with local or remote files (e.g. on network drives), with files of a specific type (e.g. only JavaScript or Python files), with large files or files with very long lines, or with files in a specific encoding? Is there anything else special about the files you are using?

Include details about your configuration and environment:

* **Which version of Node, Hexo and Next are you using?** You can get the exact version by running `node -v`, `hexo version` in your terminal, or copy the contents in site's`package.json`.
* **Which packages do you have installed?** You can get that list by copying the contents in site's`package.json`.

### Suggesting Enhancements

This section guides you through submitting an enhancement suggestion for Next, including completely new features and minor improvements to existing functionality. Following these guidelines helps maintainers and the community understand your suggestion :pencil: and find related suggestions :mag_right:.

Before creating enhancement suggestions, please check [this list](#before-submitting-an-enhancement-suggestion) as you might find out that you don't need to create one. When you are creating an enhancement suggestion, please [include as many details as possible](#how-do-i-submit-a-enhancement-suggestion). Fill in [the template](ISSUE_TEMPLATE.md), including the steps that you imagine you would take if the feature you're requesting existed.

#### Before Submitting An Enhancement Suggestion

* **Perform a  [cursory search](https://github.com/theme-next/hexo-theme-next/issues?utf8=%E2%9C%93&q=)** to see if the enhancement has already been suggested. If it has, add a comment to the existing issue instead of opening a new one. Most importantly, check if you can reproduce the problem [in the latest release version of Next](https://github.com/theme-next/hexo-theme-next/releases/latest).

#### How Do I Submit A Enhancement Suggestion?

Enhancement suggestions are tracked as [GitHub issues](https://guides.github.com/features/issues/). After you've determined the repository your enhancement suggestion is related to, create an issue on that repository and provide the following information:

* **Use a clear and descriptive title** for the issue to identify the suggestion.
* **Provide a step-by-step description of the suggested enhancement** in as many details as possible.
* **Provide specific examples to demonstrate the steps**. Include copy/pasteable snippets which you use in those examples, as [Markdown code blocks](https://help.github.com/articles/creating-and-highlighting-code-blocks/) or [a permanent link to a code snippet](https://help.github.com/articles/creating-a-permanent-link-to-a-code-snippet/), or a [gist link](https://gist.github.com/).
* **Describe the current behavior** and **explain which behavior you expected to see instead** and why.
* **Include screenshots and animated GIFs** which help you demonstrate the steps or point out the part of Next which the suggestion is related to. You can use [licecap](https://www.cockos.com/licecap/) to record GIFs on macOS and Windows, and [silentcast](https://github.com/colinkeenan/silentcast) or [byzanz](https://github.com/GNOME/byzanz) on Linux. Then [attach the file](https://help.github.com/articles/file-attachments-on-issues-and-pull-requests/) to an issue or pull request conversation, drag and drop it into the comment box.
* **Explain why this enhancement would be useful** to most Next users.
* **Specify **Which version of Node, Hexo and Next are you using?** You can get the exact version by running `node -v`, `hexo version` in your terminal, or copy the contents in site's`package.json`.

### Submitting a Pull Request

Before you submit your Pull Request (PR) consider the following guidelines. The detailed document of creating a pull request can be found [here](https://help.github.com/articles/creating-a-pull-request/).

1. **Perform a  [cursory search](https://github.com/theme-next/hexo-theme-next/pulls?utf8=%E2%9C%93&q=)** to see if the related PR has already been submitted. You don't want to duplicate effort.
1. Make your changes in a new git branch and push your branch to GitHub. Follow our [Coding Rules](#coding-rules) and [commit message conventions](#git-commit-messages).
1. In GitHub, send a pull request to `theme-next/hexo-theme-next:master`.
    - Fill in [the required template](PULL_REQUEST_TEMPLATE.md).
    - Include screenshots and animated GIFs in your pull request whenever possible.
    - Document new code based on the [Documentation Styleguide](#documentation-styleguide)
1. After your pull request is merged, you can safely delete your branch and pull the changes from the main (upstream) repository.

That's it! Thank you for your contribution!

## Styleguides

### Coding Rules

This project and everyone participating in it is governed by the [Code of Conduct](CODE_OF_CONDUCT.md) to keep open and inclusive. By participating, you are expected to uphold this code.

To ensure consistency throughout the source code, keep these rules in mind as you are working:

* End all files with a newline.
* All features or bug fixes **must be tested** in all schemes.

### Git Commit Messages

We have very precise rules over how our git commit messages can be formatted. This leads to **more
readable messages** that are easy to follow when looking through the **project history**.

Each commit message consists of a **header**, a **body** and a **footer**. Any line of the commit message cannot be longer 100 characters! This allows the message to be easier to read on GitHub as well as in various git tools.

- The header has a special format that includes a **type**, a **scope** and a **subject**. The **header** is mandatory and the **scope** of the header is optional.
    - Type must be one of the following:
        * **build**: Changes that affect the build system or external dependencies (example scopes: gulp, broccoli, npm)
        * **ci**: Changes to our CI configuration files and scripts (example scopes: Travis, Circle, BrowserStack, SauceLabs)
        * **docs**: Documentation only changes
        * **feat**: A new feature
        * **fix**: A bug fix
        * **perf**: A code change that improves performance
        * **refactor**: A code change that neither fixes a bug nor adds a feature
        * **style**: Changes that do not affect the meaning of the code (white-space, formatting, missing semi-colons, etc)
    - The scope should be the name of the npm package affected (as perceived by the person reading the changelog generated from commit messages.
    - The subject contains a succinct description of the change:
        * use the imperative, present tense: "change" not "changed" nor "changes"
        * don't capitalize the first letter
        * no dot (.) at the end
- The body should include the motivation for the change and contrast this with previous behavior. Use the imperative, present tense: "change" not "changed" nor "changes".
- The footer should contain any information about **Breaking Changes** and is also the place to reference GitHub issues that this commit **Closes**.

### Documentation Styleguide

* Use [Markdown](https://help.github.com/articles/getting-started-with-writing-and-formatting-on-github/).
* Do not include issue numbers in the PR title.
