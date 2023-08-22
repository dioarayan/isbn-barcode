<h1>ISBN Barcode Check Digit Calculator <br>(MY BEST PRACTICE)</h1>

This project covers the steps in generating the check digit of the ISBN13 barcode. The language I used is mostly Ruby on Rails because I thrived for being a full-stack developer. Future improvement for this project includes implementing CSS Framework and ISBN13 format testing.


<h2>1. Running the app</h2>

```
git clone git@github.com:dioarayan/isbn-cd-generator.git
cd isbn-cd-generator
```

<h3> A. Local machine </h3>

<h4> a. Installation</h4>

```
bundle install #install ruby gems
```

<h4> b. Run the app</h4>

``` 
rails s
```

<h3> B. With Docker </h3>

<h4> a. Installation</h4>

```
docker-compose run --rm app bundle install
```

<h4> b. Run the app</h4>

``` 
docker-compose up
```

<h2>2. Using the app</h2>

<p>Open your favorite browser and enter localhost:3000</p>

<div style="width:80px ; height:auto; border: 1px solid gray;">

  ![alt text](../assets/2023-08-18_16-30-35.png?raw=true)

</div>

<p>Try to enter an ISBN13 barcode and click Calculate button to generate the complete ISBN13.</p>

<div style="width:80px ; height:auto, border: 1px solid gray;">

  ![alt text](../assets/2023-08-18_16-31-10.png?raw=true)

</div>

<h2>3. Testing the app </h2>

Test the application by entering this on the terminal. Please ensure that you are on the same project directory before running this command.

<h3> Testing in local </h3>

```
docker-compose run --rm app rspec spec
```

<h3> Testing in docker </h3>

```
docker-compose run --rm app rspec spec
```

