# iOS Talk - Advance Debugging

Advance Debugging example with Pythagorean Theorem


## Screenshot

![Screenshot](https://github.com/poborp/iostalk-advancedebugging/blob/master/Resources/Screenshot-small.png)


## Bugs to fix

- aButton and bButton position
- aLabel value
- Remove hardcoded line `self.bValue = 1`
- calculateHypotenuse() params


## Alias Used

Save it in `~/.lldbinit`

- `command alias -h "Same as 'expression'" -- expr expression`

- `command alias -h "Same as 'expression'" -- e expression`

- `command alias -h "Refresh screen device to see the visual changes" -- flush expression -l objc -O -- [CATransaction flush]`

- `command alias -h "Refresh screen device to see the visual changes" -- fl expression -l objc -O -- [CATransaction flush]`

- `command alias -h "Same as 'po' but for swift with objc syntax" -- poc expression -l objc -O --`

## Commands resume

- `poc [self.view recursiveDescription]`

- `expression aButton.frame = CGRect(x: 10, y: 10, width: 100, height: 40)`

- `expression button.backgroundColor = .red`

- `expression -l objc -O -- [CATransaction flush]`

- `expression aLabel?.text = String(format: "a = %.0f", aValue!)`

- `thread jump --by 1`
