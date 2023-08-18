<h1>ISBN Barcode Check Digit Calculator (MY BEST PRACTICE)</h1>

This project covers the steps in generating the check digit of the ISBN13 barcode. The language I used is mostly Ruby on Rails because I thrived for being a full-stack developer. Future improvement for this project includes implementing CSS Framework and ISBN13 format testing.


<h3>1. Running the app</h3>

```
git clone git@github.com:dioarayan/isbn-cd-generator.git
cd isbn-cd-generator
```

<h4>1.1: Installation</h4>

```
bundle install #install ruby gems
```

<h4>1.2: Run the app</h4>

``` 
rails s
```


<h3>2. Using the app</h3>


  ![alt text](../assets/Screenshot_from_2023-08-18_16-30-35.png?raw=true)


  ![alt text](../assets/Screenshot_from_2023-08-18_16-31-10.png?raw=true)


<h3>3. Testing the app </h3>

Test the application by entering this on the terminal. Please ensure that you are on the project directory.

```
rspec ./spec/services/calculate_digits_service.rb
```

