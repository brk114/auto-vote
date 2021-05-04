describe("Vote for every half an hour", function () {
  it("should cast a vote", function () {
    browser.ignoreSynchronization = true;
    browser.get("https://mycutebaby.in/contest/participant/?n=6087d086ca7c4");

    browser.sleep(6000);

    var voteBtn = element(by.css("#vote_btn"));
    // printing current votes count
    var votesCount = element(by.css("#vote_count_t"));
    votesCount.getText().then((text) => console.log("Count of votes: ", text));

    console.log("Found button");
    // var voteForm = element(by.css("#votefrm_sec"));
    // if (voteForm) voteForm.submit();
    // browser.sleep(5000);

    if (voteBtn) {
      voteBtn.click();
      console.log("Voted successfully " + new Date().toLocaleString());
    }

    browser.sleep(3000);

    // You wrote your first test, cross it off the list
    // todoList.get(2).element(by.css("input")).click();
    // var completedAmount = element.all(by.css(".done-true"));
    // expect(completedAmount.count()).toEqual(2);
  });
});
