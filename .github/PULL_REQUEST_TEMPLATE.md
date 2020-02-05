<!-- ATTENTION!
1. Please write pull request readme in English, thanks!

2. Always remember that NexT includes 4 schemes. And if on one of them works fine after the changes, on another scheme this changes can be broken. Muse and Mist have similar structure, but Pisces is very difference from them. Gemini is a mirror of Pisces with some styles and layouts remakes. So, please make the tests at least on two schemes (Muse or Mist and Pisces or Gemini).

3. In addition, you need to confirm that the changes made by this PR are compatible with PJAX.

4. We use ESLint and Stylint for identifying and reporting on patterns in JavaScript and Stylus. Please execute the following commands:
```sh
cd path/to/theme-next
npm install
npm run test
npm run test lint:stylus
```
And make sure that this PR does not cause more warning messages.

5. Please check if your PR fulfills the following requirements.
-->

## PR Checklist <!-- 我确认我已经查看了 -->
<!-- Change [ ] to [x] to select (将 [ ] 换成 [x] 来选择) -->

- [ ] The commit message follows [guidelines for NexT](https://github.com/theme-next/hexo-theme-next/blob/master/.github/CONTRIBUTING.md).
- [ ] Tests for the changes was maked (for bug fixes / features).
   - [ ] Muse | Mist have been tested.
   - [ ] Pisces | Gemini have been tested.
- [ ] [Docs](https://github.com/theme-next/theme-next.org/tree/source/source/docs) in [NexT website](https://theme-next.org/docs/) have been added / updated (for features).
<!-- For adding Docs edit needed file here: https://github.com/theme-next/theme-next.org/tree/source/source/docs and create PR with this changes here: https://github.com/theme-next/theme-next.org/pulls -->

## PR Type
<!-- What kind of change does this PR introduce? -->

- [ ] Bugfix.
- [ ] Feature.
- [ ] Code style update (formatting, local variables).
- [ ] Refactoring (no functional changes, no api changes).
- [ ] Build related changes.
- [ ] CI related changes.
- [ ] Documentation content changes.
- [ ] Other... Please describe:

## What is the current behavior?
<!-- Please describe the current behavior that you are modifying, or link to a relevant issue -->

Issue resolved: N/A

## What is the new behavior?
<!-- Description about this pull, in several words -->

- Screenshots with this changes: N/A
- Link to demo site with this changes: N/A

### How to use?
In NexT `_config.yml`:
```yml

```

## Does this PR introduce a breaking change?
- [ ] Yes.
- [ ] No.
