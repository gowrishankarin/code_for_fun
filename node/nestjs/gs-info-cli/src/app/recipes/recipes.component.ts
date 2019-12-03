import { Component, OnInit, Input } from "@angular/core";
import { Recipe } from "./recipe.model";

@Component({
  selector: "app-recipes",
  templateUrl: "./recipes.component.html",
  styleUrls: ["./recipes.component.scss"]
})
export class RecipesComponent implements OnInit {
  @Input("recipeWasSelected") selectedRecipe: Recipe;
  constructor() {}

  ngOnInit() {}

  onRecipeWasSelected() {
    console.log("@Recipes Component");
  }
}
