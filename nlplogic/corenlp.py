"""
This module contains the functions to search Wikipedia for the search query,
summarize the search results, get the TextBlob object of the search results,
and get the phrases from the TextBlob object.
"""

# Import Libraries
from textblob import TextBlob
import wikipedia


# Function to get the search results from Wikipedia
def search_wikepedia(search_query):
    """
    This function searches Wikipedia for the search query and returns the search results.
    """
    print("Searching Wikipedia for: ", search_query)
    search_results = wikipedia.search(search_query)
    return search_results


# Function to get the summary of the search results from Wikipedia
def summarize_wikepedia(search_query):
    """
    This function returns the summary of the searched query.
    """
    print("Finding Wikipedia summary for: ", search_query)
    summary = wikipedia.summary(search_query)
    return summary


# Function to get the TextBlob object of an object
def get_textblob(text):
    """
    This function returns the TextBlob object of the searched query.
    """
    blob = TextBlob(text)
    return blob


# Function to summarize the searched query and return the TextBlob object
def get_phrases(search_query):
    """
    This function returns the phrases from the TextBlob object.
    """
    text = summarize_wikepedia(search_query)
    blob = get_textblob(text)
    phrases = blob.noun_phrases
    return phrases
