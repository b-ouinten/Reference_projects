import React from 'react';
import { useParams } from 'react-router-dom';
import pagesMap from '../../consts/pagesMapper';

const PagesContainer = () => {
  let { slug } = useParams();
  slug = slug || '';
  
  const matchedPage = pagesMap[slug];
  const { page } = matchedPage;
  
  return (
    <div>
      {page}
    </div>
    );
  };
  
  export default PagesContainer;