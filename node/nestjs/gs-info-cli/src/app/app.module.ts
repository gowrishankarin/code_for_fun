import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';
import { FormsModule } from '@angular/forms';

import { AppComponent } from './app.component';
import { ServerComponent } from './server/server.component';
import { ServersComponent } from './servers/servers.component';
import { WarningAlertComponent } from './warning-alert/warning-alert.component';
import { SuccessAlertComponent } from './success-alert/success-alert.component';
import { HeaderComponent } from './header/header.component';
import { RecipesComponent } from './recipes/recipes.component';
import { RecipeListComponent } from './recipes/recipe-list/recipe-list.component';
import { RecipeDetailComponent } from './recipes/recipe-detail/recipe-detail.component';
import { RecipeItemComponent } from './recipes/recipe-item/recipe-item.component';
import { ShoppingListComponent } from './shopping-list/shopping-list.component';
import { ShoppingEditComponent } from './shopping-list/shopping-edit/shopping-edit.component';
import { ServerMainComponent } from './server-main/server-main.component';
import { CockpitComponent } from './cockpit/cockpit.component';
import { ServerElementComponent } from './server-element/server-element.component';
import { GameControlComponent } from './game/game-control/game-control.component';
import { GameComponent } from './game/game.component';
import { OddComponent } from './game/odd/odd.component';
import { EvenComponent } from './game/even/even.component';

@NgModule({
  declarations: [
    AppComponent, 
    HeaderComponent,
    ServerComponent, 
    ServersComponent, 
    WarningAlertComponent,
    SuccessAlertComponent,
    RecipesComponent,
    RecipeListComponent,
    RecipeDetailComponent,
    RecipeItemComponent,
    ShoppingListComponent,
    ShoppingEditComponent,
    ServerMainComponent,
    CockpitComponent,
    ServerElementComponent,
    GameControlComponent,
    GameComponent,
    OddComponent,
    EvenComponent
  ],
  imports: [
    BrowserModule,
    FormsModule
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }

/*
ngOnChanges  - Called after a bound input property changes
ngOnInit - Called once the component is initialized
ngDoCheck - Called during every change detection run
ngAfterContentInit - Called after content has been projected into view
ngAfterViewInit - Called after the component's view(and child views) has been initialized
ngAfterViewChecked - Called every time the view(and child views) have been checked
ngOnDestroy - Called once the component is about to be destroyed
*/