import { Component, OnInit, Output, EventEmitter } from "@angular/core";
import { Recipe } from "../recipe.model";

@Component({
  selector: "app-recipe-list",
  templateUrl: "./recipe-list.component.html",
  styleUrls: ["./recipe-list.component.scss"]
})
export class RecipeListComponent implements OnInit {
  @Output() recipeWasSelected = new EventEmitter<Recipe>(); //</Recipe>
  recipes: Recipe[] = [
    new Recipe(
      "A Test Recipe",
      "This is a test recipe",
      "https://cdn.pixabay.com/photo/2016/06/15/19/09/food-1459693_960_720.jpg"
    ),
    new Recipe(
      "Not a Test",
      "This is not a test recipe",
      "https://cdn.pixabay.com/photo/2016/04/23/22/35/healthy-food-1348430_960_720.jpg"
    ),
    new Recipe(
      "A New Recipe",
      "This is a new recipe",
      "https://www.army.mil/e2/c/images/2015/10/30/414509/size0.jpg"
    )
  ];
  constructor() {}

  ngOnInit() {}

  onRecipeSelected(recipe: Recipe) {
    console.log(recipe);
    this.recipeWasSelected.emit(recipe);
  }

  onRecipeWasSelected(event: Event) {
    console.log("@Recipe List, Recipe was Selected");
  }
}
