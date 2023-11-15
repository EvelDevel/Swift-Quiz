//
//  Constants.swift
//  Swifty-Quiz
//
//  Created by Евгений Никитин on 12.05.2022.
//  Copyright © 2022 Evel-Devel. All rights reserved.
//

import Foundation

class Constants {
    static var tookHint = "Взяли подсказку"
    
    static var playedCounter = "Сыграно раз:"
    static var totalQuestions = "Всего вопросов:"
    static var learnedText = "Закрепил на "
    
    static var category = "Категория: "
    static var correctAnswers = "Правильных ответов: "
    static var questionsText = "Вопросы: "
    static var hintsText = "подсказок: "
    
    // Segue
    static var newGame = "newGame"
    static var continueGame = "continueGame"
    static var toTopicSelection = "toTopicSelection"
    static var toResultsViewController = "toResultsViewController"
    static var toSettingsViewController = "toSettingsViewController"
    static var toHelpViewController = "toHelpViewController"
    static var toSourceViewController = "toSourceViewController"
    
    // Stats
    static var scoreSectionHeader = "Счет и прохождение"
    static var gameSectionHeader = "Категории и игры"
    static var totalQuesionsTitle = "Вопросов в игре"
    static var playedQuestionTitle = "Вопросов прошел"
    static var givenAnswersTitle = "Всего ответов"
    static var correctGivenAnswersTitle = "Правильных ответов"
    static var incorrectAnswersTitle = "Неправильных"
    static var scorePointsTitle = "Заработал очков"
    static var progressPercentageTitle = "Прогресс"
    static var correctPercentageTitle = "Процент правильных ответов"
    static var incorrectPercentageTitle = "Процент неправильных ответов"
    static var tipsPercentageTitle = "Процент взятых подсказок"
    static var gamesPlayedTitle = "Завершил игр"
    static var unfinishedGamesTitle = "Не завершил игр"
    static var allTopicsCountTitle = "Категорий в игре"
    static var userPlayedTitle = "Я прошел"
    static var topicsPlayedTitle = "Прогресс по категориям"
    static var unfinishedPercentageTitle = "Процент незавершенных игр"
    static var correctnessSectionHeader = "Успеваемость"
    static var wordingsTitle = "Формулировок"
    static var withImageTitle = "Вопросов с картинкой"
    
    // Game
    static var lastGameInfoTitle = "Информация о прошлой игре: "
    static var currentGameInfoTitle = "Информация о текущей игре: "
    static var topicTitle = "Категория: "
    static var questionsTitle = "Вопросы: "
    static var hintsTitle = "подсказок: "
    static var correctAnswersTitle = "Правильных ответов: "
    static var scoreTitle = "Ваш счет"
    static var restartActionAlert = "Перезапустить"
    static var quitActionAlert = "Выйти"
    static var helpActionAlert = "Поддержка проекта"
    
    static var scoreBelow35Message = "Не сдавайтесь, пока результат слабый, но у вас все получится!"
    static var scoreBelow55Message = "Достойный результат, но нужно продолжать работать!"
    static var scoreBelow85Message = "Уже хорошо! Но вы можете постараться сделать еще лучше!"
    static var scoreAbove85Message = "Превосходно! Продолжайте в том же духе и по остальным темам!"
    
    static var unfinishedGameTitle = "Незавершенная игра"
    static var unfinishedGameMessage = "Если вы ответите хотя бы на один вопрос или выберете другую тему, вы потеряете возможность закончить незавершенную игру"
    static var continueGameTitle = "Продолжить"
    
    static var areYouSureTitle = "Вы уверены?"
    static var cantRestoreRecordsMessage = "Рекорды нельзя будет восстановить"
    static var removeRecordsTitle = "Удалить"
    static var cancelRemovingRecords = "Отмена"
    static var correctAnswersIs100 = "100%"
    static var recordCellHintTitle = "Подсказки: "
    static var recordCellDateTitle = "Дата: "
    static var recordCellQuestionTitle = "Вопросы: "
    static var recordCellScoreTitle = "Очки: "
    
    static let historyProblemTitle = "Сообщить о проблеме"
    static let historyProblemSendTitle = "Вы хотели сообщить о проблеме с вопросом"
    static let historyProblemSendMessage = "К сожалению ваше устройство не может отправлять почту. Скорее всего, у вас нет ни одной активной учетной записи в приложении \"почта\"."
    static let historyUnderstandTitle = "Понятно"
    static let historyProblemSendError = "Возникла ошибка при отправке письма"
    
    // Identifiers
    static var initialViewIdentifier = "InitialViewController"
    static var gameHistoryIdentifier = "GameHistoryViewController"
    
    // Storyboards
    static var main = "Main"
    static var gameHistory = "GameHistory"
    
    // Keys
    static var appVersionKey = "CFBundleShortVersionString"
    
    // Cells
    static var recordCellIdentifier = "RecordCell"
    
    // Source vc
    static var sourceLinkTitle = "Упс, кажется эта ссылка кривая"
    static var sourceLinkMessage = "Вы можете сообщить на hello@swifty-quiz.ru о проблеме со ссылкой в вопросе №"
    static var sourceAlertTitle = "Закрыть"
    
    // Settings
    static var settingsReturnTitle = "Вернуться в игру"
    static var settingsOrderTitle = "Последовательность вопросов"
    static var settingsOrderMessage = "В случае прямой последовательности вопросы каждую игру будут идти в одном порядке. Если вы выберете случайную последовательность, порядок вопросов никогда не повторится дважды."
    static var settingsWordingTitle = "Формулировка текста вопроса"
    static var settingsWordingMessage = "У каждого вопроса в игре есть несколько формулировок вопроса - от одной до трех. Если вы хотите сделать игру сложнее, включите изменение формулировок, тогда глазу будет труднее вспомнить вопрос."
    static var settingsIncorrectTitle = "При неправильном ответе"
    static var settingsIncorrectMessage = "После неправильного ответа вы можете просто идти дальше или получать теоретическую подсказку, которая поможет понимать сразу, какой ответ был правильным. Это замедляет ход игры, но делает ее более информативной."
    static var settingsHintTitle = "Переход после подсказки"
    static var settingsHintMessage = "После каждой подсказки вы можете автоматически переходить к следующему вопросу, а можете оставаться, чтобы еще раз внимательно прочитать вопрос и выбрать правильный ответ. После использования подсказки вам не будут засчитаны очки."
    
    // Analytics
    static var userScore = "User_Score"
    static var currentCategory = "Current_Category"
    static var mainScreenButtonSegue = "Main_Screen_Button_Segue"
    static var statScreenLaunched = "Stat_Screen_Launched"
    
    // Compliments
    static let compliments = [
        "Отличная работа!",
        "Ты молодец!",
        "Молодец, так держать!",
        "Замечательно!",
        "Ты супер!",
        "Браво!",
        "Умница!",
        "Великолепно!",
        "Очень хорошо!",
        "Превосходно!",
        "Так держать!",
        "Прекрасная работа!",
        "Круто!"
    ]
}
