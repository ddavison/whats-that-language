/**
 * Created by ddavison on 5/26/15.
 * Score Keeper Class
 */

var ScoreKeeper = function(){};


/**
 * The total score
 * @type {number}
 */
ScoreKeeper.prototype.score = 0;

/**
 * Add a specified score to the total
 * @param score (default: 100)
 */
ScoreKeeper.prototype.addScore = function(score) {
  this.score += (score > 0 ? score : 100);
  return this.score;
};

/**
 * Remove score from the total
 * @param score the score to remove
 * @returns {number}
 */
ScoreKeeper.prototype.subtractScore = function(score) {
  this.score -= score;
  return this.score;
}

/**
 * Get the current score
 * @returns {number}
 */
ScoreKeeper.prototype.getScore = function() {
 return this.score;
};

window.ScoreKeeper = new ScoreKeeper();
