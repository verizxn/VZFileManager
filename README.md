# VZFileManager
Easy way to handle File Manager in Swift.

## Example code

```swift
let file = VZFileManager(name: "test.txt")
file.save(contents: "This is a test") //Save data to the file

print(file.exists()) //Check if file exists
print(file.getString()) //Get the content of the file

file.delete() //Delete the file
```
