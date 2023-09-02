![Swift Build](https://github.com/verizxn/VZFileManager/actions/workflows/swift.yml/badge.svg)
# VZFileManager
Easy way to handle File Manager in Swift.

## Example code
```swift
let file = VZFileManager(name: "test.txt")
file.save(contents: "This is a test") //Save string to the file

print(file.exists()) //Check if file exists
print(file.getString() ?? "Not a string") //Get the content of the file, if it's plain text

file.delete() //Delete the file
```

## Advanced example code
```swift
let file = VZFileManager(name: "image.png")
let image = UIImage(systemName: "pencil")

//Save image data to the file
if let data = image.pngData() {
    file.save(contents: data)
}

// Get data, if it's data
if let data = file.getData() {
    let image2 = UIImage(data: data)

    // [...]
}
```
