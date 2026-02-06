class AppConstants {
  static const kAppName = "GoalNest";
  static const kAppSubtitle = "Your perfect Money Tracker";

  static const kStringUserName = "user_name";
  static const kGoalJsonKey = "goal_types";
  static const String kServerEndDate = "server_end_date";
  static const String kExpiredMessage = "Your server hosting has expired. If you are the owner Please contact the administrator at admin@bigrock.in  or developer to renew.";
  static const String kNoGoalMessage = "You don't have any goals yet. Create a goal to get started.";

  static const String kGoalTypeKey = "goal_types";

  static const String kGoalNestDb = "goal-nest";

  static const String kGoalNameInputHeaderTitle = "Goal Name";
  static const String kGoalNameInputHint = "Enter your goal name";
  static const String kStartDateInputHeaderTitle = "Start Date";
  static const String kStartDateInputHint = "Choose your start date";
  static const String kEndDateInputHeaderTitle = "End Date";
  static const String kEndDateInputHint = "Choose your end date";
  static const String kGoalAmountInputHeaderTitle = "Goal Amount";
  static const String kGoalAmountInputHint = "Enter your goal amount";
  static const String kCurrentAmountInputHeaderTitle = "Current Amount";
  static const String kCurrentAmountInputHint = "Enter your current amount";

  static const int kEndInOneYear = 365;
  static const int kEndInTwentyYear = 365 * 21;
  static const String kSummaryOfYourGoals = "Summary of your goals";
  static const String kWhyCreateGoalTitle = "Why create a goal?";
  static const String kWhyCreateGoalDescription = "Creating a goal helps you stay focused and motivated to achieve your financial goals. It also helps you track your progress and stay on track. With a goal, you can break down your financial goals into smaller, achievable steps, making it easier to stay motivated and track your progress.";
  static const String kCompleted = "Completed";
  static const String kGoalCompleted = "Mark this goal as completed";
  static const String kWhyMarkAsCompletedDescription = "Marking a goal as completed will close the goal and you will be seeing this goal in the completed section";

  static const String kNoGoalCompletedTitle = "No Goals completed";
  static const String kNoGoalCompletedDescription = "Stay Motivated and invest wisely to see your goals getting completed here...";
  static const String kNoPendingGoalsTitle = "No Pending Goals Found";
  static const String kNoPendingGoalDescription = "Have a goal in mind? If yes, create it and see them here...";
  static const String kNoActivityTitle = "No Transactions Found";
  static const String kNoActivityDescription = "Whenever you make a progress in your goal you should be seeing them here. For every penny saved we will help you track its date";

  ///---------------- Ecommerce App Constants ------------------\\\\\\\
  static const String kBaseUrl = "https://fake-store-api.mock.beeceptor.com/";
  static const String kGetAllProductsEndpoint = "api/products";
}